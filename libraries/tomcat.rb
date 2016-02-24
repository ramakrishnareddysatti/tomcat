#
# Cookbook Name:: tomcat
# Library:: tomcat
#
# Author:: Tim Smith (<tim@chef.io>)
#
# Copyright 2016, Chef Software, Inc.
#
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
#

# the install path of this instance of tomcat
def derived_install_path
  install_path ? install_path : "/opt/tomcat_#{instance_name}"
end

# make sure catalina base is in the env_var has no matter what
def ensure_catalina_base
  unless env_vars.any? { |env_hash| env_hash.key?('CATALINA_BASE') }
    env_vars.unshift('CATALINA_BASE' => derived_install_path)
  end
end
