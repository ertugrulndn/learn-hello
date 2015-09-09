module LearnVerify
  class Verification
    attr_reader   :client
    attr_accessor :result

    def initialize
      _login, token = Netrc.read['learn-config']
      @client       = LearnWeb::Client.new(token: token)
    end

    def self.execute
      new.execute
    end

    def execute
      verify
      output_result
    end

    private

    def verify
      puts 'Verifying connection...'
      self.result = client.verify_environment
    end

    def output_result
      if result.success?
        puts "Success!".green
      else
        puts "Sorry, something went wrong. Please get in touch so we can help."
      end
    end
  end
end
