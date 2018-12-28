Moodle::Api.configure do|c|
    c.host = Settings.moodle.host
    c.token = Settings.moodle.token
end