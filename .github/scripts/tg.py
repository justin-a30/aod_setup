import os
import requests

botapi = os.getenv('BOT_TOKEN')
commit_message = os.getenv('COMMIT_MESSAGE', 'No commit message found')
commit_url = os.getenv('COMMIT_URL', 'example.com')
commit_run = os.getenv('RUN_URL', 'example.com')
version = os.getenv('version', 'NULL')
url = f"http://127.0.0.1:8081/bot{botapi}/sendDocument"
file_path = os.getenv('MODULE')
file_name = os.path.basename(file_path)
chat_id = os.getenv('CHAT_ID')

payload = {
    'chat_id': '-1002059105712',
    'caption': f"*ModdedXGoodies* \- {version}\n\n> {commit_message}\n\n[Commit URL]({commit_url})\n[Run URL]({commit_run})",
    'parse_mode': 'MarkdownV2'
}
files = {
    'document': (file_name, open(file_path, 'rb'), 'application/zip')
}
headers = {}

response = requests.post(url, headers=headers, data=payload, files=files)

print(response.text)
