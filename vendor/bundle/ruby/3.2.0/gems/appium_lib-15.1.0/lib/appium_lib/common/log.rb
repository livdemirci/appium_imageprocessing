# frozen_string_literal: true

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

module Appium
  module Common
    # @param [String|Hash] type You can get particular type's logs.
    # @return [[Selenium::WebDriver::LogEntry]] A list of logs data.
    #
    # @example
    #
    #   @driver.get_log("syslog") #=> [[Selenium::WebDriver::LogEntry]]
    #   @driver.get_log(:syslog)  #=> [[Selenium::WebDriver::LogEntry]]
    #
    def get_log(type)
      @driver.logs.get type
    end

    # Get a list of available log types
    #
    # @return [[String]] A list of available log types.
    #
    # @example
    #
    #   @driver.get_available_log_types #=> [:syslog, :crashlog, :performance]
    #
    def get_available_log_types
      @driver.logs.available_types
    end
  end # module Common
end # module Appium
