EXECUTE0=$(curl -X POST -H "Content-Type: application/json" -u suvadip30:'SUVAman$9614' https://bitbucket.org/api/2.0/repositories/suvadip30/test-patch/pullrequests -d '{ "title": "Merge some branches", "description": "stackoverflow example", "source": { "branch": { "name": "dev" }, "repository": { "full_name": "suvadip30/test-patch" } }, "destination": { "branch": { "name": "stage" } }, "reviewers": [ { "username": "some other user needed to review changes" } ], "close_source_branch": false }' | grep 'branch not found:\|There are no changes to be pulled' | wc -l)

if [ "$EXECUTE0" -eq 0 ]; then
echo "there is pull request"
EXECUTE1=$(curl --user suvadip30:'SUVAman$9614' https://bitbucket.org/api/2.0/repositories/suvadip30/test-patch/pullrequests | sed -e 's/^.*\("id": [^ ,]*\).*$/\1/' | awk {'print $2'})
EXECUTE2=$(sed "s/id/$EXECUTE1/g" /tmp/bitbucketget_des.txt > /tmp/bitbucket_des.sh)
echo $EXECUTE2
else
echo "there is no pull request"
fi
