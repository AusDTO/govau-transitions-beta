Fabricator(:answer) do
  owner { Fabricate(:session_user) }
end
