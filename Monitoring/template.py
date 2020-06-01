from pyquery import PyQuery as pq
from aws_ses_email import send_email
import requests
import os
import logging
import datetime
import argparse
# run aws configure first


# setup
parser = argparse.ArgumentParser(description='Monitor template')
parser.add_argument('--dbDir', required=True, type=str, help='db dir')
parser.add_argument('--dbFile', required=True, type=str, help='db filename')
parser.add_argument('--logDir', required=True, type=str, help='log dir')
parser.add_argument('--logFile', required=True, type=str, help='log filename')
args = parser.parse_args()
self_dir = os.path.dirname(os.path.realpath(__file__))
db = args.dbDir
log = args.logDir

# create log dir if not exist
if not os.path.exists(os.path.join(self_dir, log)):
    os.makedirs(os.path.join(self_dir, log))
# setup log file
logging.basicConfig(filename=os.path.join(self_dir, log, args.logFile), level=logging.INFO,
                    format='%(asctime)s: %(name)s - %(levelname)s - %(message)s', filemode='a')
# create db dir if not exist
if not os.path.exists(os.path.join(self_dir, db)):
    logging.warning("{} DNE, try creating it".format(
        os.path.join(self_dir, db)))
    os.makedirs(os.path.join(self_dir, db))
version_file_name = args.dbFile
url = "https://www.adobezii.com/universal-patcher/"


def monitor():
    response = requests.get(url)

    doc = pq(response.text)

    title = doc("h1")[0].text
    logging.info("Monitoring title: {}".format(title))
    zii_version = title.split()[2]

    def write_to_file_helper():
        f = open(os.path.join(self_dir, db, version_file_name), 'w')
        f.write(zii_version)
        f.close()
    if not os.path.exists(os.path.join(self_dir, db, version_file_name)):
        write_to_file_helper()
        return zii_version
    else:
        f = open(os.path.join(self_dir, db, version_file_name), 'r')
        stored_version = f.readline()
        f.close()
        write_to_file_helper()

        if zii_version != stored_version:
            return zii_version
        else:
            return False


if __name__ == "__main__":
    logging.info("Monitoring %s check for new release", url)
    ret = monitor()
    if not ret:
        logging.info("Template Not Triggered. Email notification not sent")
        exit(0)
    logging.info("Adobe Zii has new update: {}".format(ret))
    SENDER = "huakun.shen@gmail.com"

    RECIPIENTS = ["shenhuakun@outlook.com"]

    CcAddresses = ["huakun.shen@gmail.com"]

    AWS_REGION = "us-east-1"

    SUBJECT = "Adobe Zii has new Release: {}".format(ret)

    BODY_TEXT = ("Adobe Zii has new Release: {}".format(ret))

    BODY_HTML = """
    <html>
    <head></head>
    <body>
    <h1>{}</h1>
    <a href="https://www.adobezii.com/universal-patcher/">Go to Adobe Zii</a>
    </body>
    </html>
                """.format(SUBJECT)

    CHARSET = "UTF-8"
    logging.info("Sending email notification")
    send_email(sender=SENDER, recipients=RECIPIENTS, aws_region=AWS_REGION,
               subject=SUBJECT, body_text=BODY_TEXT, body_html=BODY_HTML, charset=CHARSET, cc=CcAddresses)
