***JSON for setting bucket permission:-
"Granting s3:PutObject permission with a condition requiring the bucket owner to get full control"
"since bucket was getting created Owner enforced so object level ACL is overridden by Bucket level policy***


{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "statement1",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::390844748690:user/Mankudaa"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::vpc-state-bucket/*",
            "Condition": {
                "StringEquals": {
                    "s3:x-amz-acl": "bucket-owner-full-control"
                }
            }
        }
    ]
}