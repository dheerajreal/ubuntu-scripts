echo "Type in your name (no special characters): "
read name

echo "Type in your email address (GitHub account email): "
read email

git config --global user.email $email
git config --global user.name $name


echo "done"
