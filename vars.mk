#======================================================================
# vars.mk : variables used in multiple Makefiles.
#======================================================================

# Output directory for local build.
SITE = _site

# All-in-one Markdown version of material.
BOOK_MD = ./book.md

# Source Markdown files.  These are listed in the order in which they
# appear in the final book-format version of the notes.
MOST_SRC = \
         intro.md \
	 01-korean-translation.md \
	 02-acknowledgements.md \
	 csunplugged/01-part/intro.md $(sort $(wildcard csunplugged/01-part/??-*.md)) \
	 csunplugged/02-part/intro.md $(sort $(wildcard csunplugged/02-part/??-*.md)) \
	 csunplugged/03-part/intro.md $(sort $(wildcard csunplugged/03-part/??-*.md)) \
	 csunplugged/04-part/intro.md $(sort $(wildcard csunplugged/04-part/??-*.md)) \
	 csunplugged/05-part/intro.md $(sort $(wildcard csunplugged/05-part/??-*.md)) \
	 csunplugged/06-part/intro.md $(sort $(wildcard csunplugged/06-part/??-*.md)) \
	 bib.md \
	 LICENSE.md

# Other files that the site depends on.
EXTRAS = \
       $(wildcard css/*.css) \
       $(wildcard css/*/*.css)

# Principal target files
INDEX = $(SITE)/index.html
