var download = require('download-file');

var url = "https://gov-au-ui-kit.apps.staging.digital.gov.au/latest/_ui-kit.scss";

var options = {
  directory: "./vendor/assets/stylesheets/",
  filename: "_ui-kit.scss"
};

download(url, options, function(err){
  if (err) throw err;
  console.log("Successfully downloaded the latest version of the ui-kit");
});
