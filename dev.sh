rm book.md &&
rm -rf _site &&
make -f book.mk html &&
cd _site/ &&
google-chrome book.html
