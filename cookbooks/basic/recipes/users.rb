group 'docker' do
  action :create
  append true
end

user 'mfeng' do
  comment "Matt's Admin account"
  home '/home/mfeng'
  group 'docker'
  shell '/bin/bash'
  password 'testing'
  action :create
end


