import os
import shutil
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

# 创建 send 目录（如果不存在）并清空其所有内容
send_folder = os.path.join(jar_folder, 'send')
if not os.path.exists(send_folder):
    os.mkdir(send_folder)
else:
    shutil.rmtree(send_folder)
    os.mkdir(send_folder)

# 获取文件夹内所有文件的路径和修改时间
files = [(f, os.path.getmtime(os.path.join(jar_folder, f))) for f in os.listdir(jar_folder) if
         os.path.isfile(os.path.join(jar_folder, f))]

# 找到修改日期最新的文件
latest_file = max(files, key=lambda x: x[1])[0]

# 复制最新的 JAR 文件到 send 目录下
shutil.copy2(os.path.join(jar_folder, latest_file), send_folder)
