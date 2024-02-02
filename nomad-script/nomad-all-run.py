import os
import sys

# 获取当前脚本文件所在的目录
script_dir = os.path.dirname(os.path.abspath(__file__))

# 读取参数
job = sys.argv[1]

# 拼接得到 jar 目录的绝对路径
jar_folder = os.path.join(script_dir + '/{}'.format(job), 'jar')
jar_folder_absolute = os.path.abspath(jar_folder)

# 将路径中的 \ 替换为 /
jar_folder_absolute = jar_folder_absolute.replace('\\', '/')

# 获取文件夹内所有文件的路径和修改时间
files = [(f, os.path.getmtime(os.path.join(jar_folder, f))) for f in os.listdir(jar_folder) if
         os.path.isfile(os.path.join(jar_folder, f))]

# 找到修改日期最新的文件
latest_file = max(files, key=lambda x: x[1])[0]

content = """job "{}" {{
  datacenters = [
    "dc1"]

  type = "service"

  group "dev" {{
    count = 1
    update {{
      canary = 1
      # 灰度发布实例数量
      max_parallel = 1
      # 替换速度
      health_check = "checks"
      min_healthy_time = "5s"
      healthy_deadline = "30s"
      progress_deadline = "21m"
      auto_revert = true
      # 灰度发布期间，当健康检查通过后，直接替换实例
      auto_promote = true
    }}

    task "web" {{
      driver = "raw_exec"
      env {{
        JAR_HOME = "{}"
      }}
      config {{
        command = "java"
        args = [
          "-jar",
          "${{JAR_HOME}}/{}",
          "--server.port=0",
          "--spring.profiles.active=qwj",
          "--server.tomcat.basedir=${{JAR_HOME}}/temp"
        ]
      }}
    }}
  }}
}}""".format(job, jar_folder_absolute, latest_file)

# 配置文件名
filename = "{}.hcl".format(job)
# 写出配置文件
with open(filename, 'w', encoding='utf-8') as file:
    file.write(content)
# 执行nomad run命令
os.system('nomad run {}'.format(filename))
