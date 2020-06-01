import boto3
from botocore.exceptions import ClientError
# run aws configure first


def send_email(sender: str, recipients: list, aws_region: str, subject: str, body_text: str, body_html: str, charset: str, cc=[], reply_to_addr=[]):
    # Create a new SES resource and specify a region.
    client = boto3.client('ses', region_name=aws_region)
    # print(client)
    # Try to send the email.
    try:
        # Provide the contents of the email.
        response = client.send_email(
            Destination={
                'ToAddresses': recipients,
                'CcAddresses': cc
            },
            ReplyToAddresses=reply_to_addr,
            Message={
                'Body': {
                    'Html': {
                        'Charset': charset,
                        'Data': body_html,
                    },
                    'Text': {
                        'Charset': charset,
                        'Data': body_text,
                    },
                },
                'Subject': {
                    'Charset': charset,
                    'Data': subject,
                },
            },
            Source=sender
        )
    # Display an error if something goes wrong.
    except ClientError as e:
        print("error: ClientError\n\n")
        print(e.response['Error']['Message'])
        return e.response['Error']['Message']
    except Exception as e:
        print("Unknown Exception")
        print(e)
    else:
        print("Email sent! Message ID:"),
        print(response['MessageId'])
        print(response)
        return response
