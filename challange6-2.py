#!/usr/bin/env python3
# This tasks is super hard in Swift for us total noobs, so we used python.
import requests
import zipfile


def find_next_nothing(folder, filename):
    with unzipped_folder.open(filename) as file:
        content = file.read().decode('utf-8')

        comment = next(info for info in files_info if info.filename == filename).comment.decode('utf-8')

        if not content.startswith('Next nothing is'):
            return None, comment

        nothing = content.split('nothing is ')[-1]

    return nothing, comment


with open('data.zip', 'wb') as zip_file:
    zip_file_content = requests.get('http://www.pythonchallenge.com/pc/def/channel.zip').content
    zip_file.write(zip_file_content)

with zipfile.ZipFile('data.zip') as unzipped_folder:
    with unzipped_folder.open('readme.txt') as file:
        nothing = file.read().decode('utf-8').split('hint1: start from ')[-1].split('\n')[0]

    files_info = unzipped_folder.infolist()

    comments = []
    while True:
        filename = '{}.txt'.format(nothing)
        nothing, comment = find_next_nothing(unzipped_folder, filename)
        comments.append(comment)
        if not nothing:
            break

print(''.join(comments))

# It's in the letters.
# Oxygen