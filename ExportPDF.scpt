JsOsaDAS1.001.00bplist00?Vscript_?function keynoteExportPDF(keynote, inFile) {
	console.log('inFile:', inFile.toString());

	const outFile = Path(inFile.toString().replace(/\.[^\.]+$/, '.pdf'));
	console.log('outFile:', outFile.toString());

	const document = keynote.open(inFile);

	keynote.export(document, {to: outFile, as: 'PDF'});

	keynote.close(document, {saving: 'no'});
}

function pagesExportPDF(pages, inFile) {
	console.log('inFile:', inFile.toString());

	const outFile = Path(inFile.toString().replace(/\.[^\.]+$/, '.pdf'));
	console.log('outFile:', outFile.toString());

	const document = pages.open(inFile);

	pages.export(document, {to: outFile, as: 'PDF'});

	pages.close(document, {saving: 'no'});
}

const keynote = Application('Keynote');
const pages = Application('Pages');

const keynoteTypes = ['ppt', 'pptx', 'keynote.key'];
const pagesTypes = ['doc', 'docx', 'pages'];
const allTypes = [...keynoteTypes, ...pagesTypes];

const app = Application.currentApplication();
app.includeStandardAdditions = true;

const inFiles = app.chooseFile({
	withPrompt: 'Please select documents to process:',
	ofType: allTypes,
	multipleSelectionsAllowed: true
});

keynote.activate();
pages.activate();

for (const inFile of inFiles) {
	if (keynoteTypes.some((type) => inFile.toString().endsWith(type))) {
		keynoteExportPDF(keynote, inFile);
	} else if (pagesTypes.some((type) => inFile.toString().endsWith(type))) {
		pagesExportPDF(pages, inFile);
	}
}

keynote.quit();
pages.quit();

app.quit();                              ? jscr  ??ޭ