JsOsaDAS1.001.00bplist00?Vscript_?
function pagesExportPDF(pages, inFile) {
	console.log('inFile:', inFile.toString());

	const outFile = Path(inFile.toString().replace(/\.[^\.]+$/, '.pdf'));
	console.log('outFile:', outFile.toString());

	const document = pages.open(inFile);

	pages.export(document, {to: outFile, as: 'PDF'});

	pages.close(document, {saving: 'no'});
}

const app = Application.currentApplication();
app.includeStandardAdditions = true;

const inFiles = app.chooseFile({
    withPrompt: 'Please select documents to process:',
	ofType: ['doc', 'docx', 'pages'],
	multipleSelectionsAllowed: true
});

const pages = Application('Pages');

pages.activate();

for (const inFile of inFiles) {
	pagesExportPDF(pages, inFile);
}

pages.quit();
app.quit();
                              ? jscr  ??ޭ