#
# Cookbook Name:: tomoyo
# Recipe:: tomoyo_tools
#

tomoyo = node['tomoyo']

commands = [
  ["Download tomoyo tools", "wget -O tomoyo-tools-2.5.0-20140105.tar.gz 'http://sourceforge.jp/frs/redir.php?m=jaist&f=/tomoyo/53357/tomoyo-tools-2.5.0-20140105.tar.gz'"],
  ["Download tomoyo tools asc", "wget -O tomoyo-tools-2.5.0-20140105.tar.gz.asc 'http://sourceforge.jp/frs/redir.php?m=jaist&f=/tomoyo/53357/tomoyo-tools-2.5.0-20140105.tar.gz.asc'"],
  ["Download tomoyo tools key", "wget http://I-love.SAKURA.ne.jp/kumaneko-key"],
  ["Import tomoyo tools key", "gpg --import kumaneko-key"],
  ["Sign tomoyo tools archive", "gpg tomoyo-tools-2.5.0-20140105.tar.gz.asc"],
  ["Extract tomoyo tools", "tar -zxf tomoyo-tools-2.5.0-20140105.tar.gz"]
]

commands.each do |desc, com|
  execute desc do
    cwd "/tmp"
    command com
    action :run
    not_if { ::File.exists?(tomoyo['tomoyo_path']) }
  end
end

execute "Install tomoyo-tools" do
  cwd "/tmp/tomoyo-tools"
  command "make -s USRLIBDIR=#{tomoyo['usrlib_path']} && \
           make -s USRLIBDIR=#{tomoyo['usrlib_path']} install"
  action :run
  not_if { ::File.exists?(tomoyo['tomoyo_path']) }
end

execute "ldconfig" do
  command "ldconfig /usr/lib64"
  action :nothing
  subscribes :run, "execute[Install tomoyo-tools]"
end
