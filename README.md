# EPUB for Clara Katharina Pollaczek’s »Arthur Schnitzler und ich«

## GitHub-Action

The GitHub-Action "Create EPUB" fetches data from https://github.com/arthur-schnitzler/pollaczek-data/tree/main/data/editions and transforms the XML files to XHTML.

With these XHTML files it produces an E-Book.

## If working manually
Reproduce the workflow defined here: https://github.com/arthur-schnitzler/pollaczek-epub/blob/main/.github/workflows/epub.yaml

… means:

- If you don’t have Saxon installed, run:
```
sh shellscripts/dl_saxon.sh
```
- Download/Pull edition files from https://github.com/arthur-schnitzler/arthur-schnitzler-arbeit/tree/main/editions and save them to a subdirectory named editions or run:
```
sh fetch-data.sh
```
- Transform the edition files and rename the suffixes of the edition files to .xhtml by running
```
ant -f editions-to-epub.xml
```
- Remove empty namespace declarations by running
```
python remove-empty-namespace-declarations.py
```
- Remove files that were (for whatever reason) not transformed by running
```
python remove-tei-files.py
```
- Generate TOCs for the epub, means: transform OEBPS/content.opf, OEBPS/texts/inhalt.xhtml and OEBPS/texts/inhaltsverzeichnis.ncx by running
```
ant -f create-tocs.xml
```
- Create the EPUB by running
```
zip -rX out/pollaczek.epub mimetype META-INF/ OEBPS/ -x "*.DS_Store" -x "README.md" -x "epubcheck.jar" -x "lib" -x "out" -x "obsolete" -x "xslt" -x ".gitignore" -x ".git" -x ".github" -x "fetch-data.sh" -x "remove-empty-namespace-declarations.py" -x "remove-tei-files.py" -x "shellscripts" -x "editions-to-epub.xml" -x "create-tocs.xml" -x "LICENSE"
```
- Optionally: Validate the EPUB by running
```
java -jar epubcheck.jar out/pollaczek.epub
```
- Commit and push
