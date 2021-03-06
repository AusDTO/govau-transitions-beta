class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  after_filter :set_csrf_cookie

  def set_csrf_cookie
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

  def answer_session_for(wizard)
    @answer_sessions ||= {}
    @answer_sessions[wizard] ||= find_or_create_answer_session(wizard)
  end

  protected

  def verified_request?
    super || valid_authenticity_token?(session, request.cookies['XSRF-TOKEN'])
  end

  private

  def find_or_create_answer_session(wizard)
    wizard_key = :"wizard_#{wizard.id}"
    token = session[wizard_key]

    if token.present?
      answer_session = AnswerSession.find_by_token token

      if answer_session.present?
        if answer_session.wizard != wizard
          logger.warn "Session token #{token} did not match wizard #{wizard}"
          session[wizard_key] = nil
          answer_session = nil
        end
      end
    end

    unless answer_session.present?
      answer_session = AnswerSession.create wizard: wizard
      session[wizard_key] = answer_session.token
    end

    answer_session
  end
end
