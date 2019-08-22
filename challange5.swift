#!/usr/bin/env swift
// This task is specifically for Python, we should have to use the Pickle library

// #!/usr/bin/env python3

// import requests
// import pickle

// page_content = requests.get('http://www.pythonchallenge.com/pc/def/peak.html').text
// binary_file_name = page_content.split('<peakhell src="')[-1].split('"/>')[0]
// binary_dump = requests.get('http://www.pythonchallenge.com/pc/def/{}'.format(binary_file_name)).content

// pattern = pickle.loads(binary_dump)
// [ print(''.join(( symbol * count for symbol, count in line ))) for line in pattern ]