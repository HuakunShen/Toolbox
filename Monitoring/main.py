from aws_ses_email import send_email

SENDER = "huakun.shen@gmail.com"

RECIPIENTS = ["shenhuakun@outlook.com"]

CcAddresses = ["huakun.shen@gmail.com"]

AWS_REGION = "us-east-1"

SUBJECT = "Amazon SES Test (SDK for Python)"

BODY_TEXT = ("Amazon SES Test (Python)\r\n"
             "This email was sent with Amazon SES using the "
             "AWS SDK for Python (Boto)."
             )

BODY_HTML = """<html>
<head></head>
<body>
  <h1>Amazon SES Test (SDK for Python)</h1>
  <p>This email was sent with
    <a href='https://aws.amazon.com/ses/'>Amazon SES</a> using the
    <a href='https://aws.amazon.com/sdk-for-python/'>
      AWS SDK for Python (Boto)</a>.</p>
</body>
</html>
            """

CHARSET = "UTF-8"

send_email(sender=SENDER, recipients=RECIPIENTS, aws_region=AWS_REGION,
           subject=SUBJECT, body_text=BODY_TEXT, body_html=BODY_HTML, charset=CHARSET, cc=CcAddresses)
