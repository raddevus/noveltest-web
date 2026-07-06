---
title: The Source Code Rabbit-hole (Inspired by NPM) 
slug: source code rabbit-hole
publishDate: 14 Dec 2025
description: How far do you travel down the source code rabbit-hole? How much do you need to know about your dependencies? 
---
### Background
I want to create a _simple_ email viewer.
That's bec I'm using MailKit (via [C# / Nuget](https://www.nuget.org/packages/MailKit/)) to download the email messages from my email server.

So, I will just accept that dependency, bec it is Nuget & feels official.  So that is a rabbit-hole I won't travel down.

#### NPM Rabbit-hole
I look around for a library that allows me to view the eml (email data format) files as HTML.

Cool, I find a node package which will convert eml to html.  [eml-parser via NPM](https://www.npmjs.com/package/eml-parser).

##### View Source Code (yes, it's JS)
You can view the bulk of the source code for this parser, [here (also on the NPM site)](https://www.npmjs.com/package/eml-parser?activeTab=code).

That doesn't look terrible.  Ok, let's take a look at the eml-parser's dependencies shown [here (on NPM site)](https://www.npmjs.com/package/eml-parser?activeTab=dependencies).  There are only 7 dependencies, so it can't be that bad, right?

##### EML to PDF
Oh, there's one that allows you to convert from EML directly to PDF.  Let's take a look, [here (again on NPM site)](https://www.npmjs.com/package/html-pdf). 

##### Deprecated! 
Well, that package has a warning that it is deprecated and you should use puppeteer now instead.  

##### Ignore It & Try Sample
Ok, I got it.  For now I say, "forget it, let's try a sample".

##### Create Node Project
1. create a quick node project
2. install the eml-parser
3. copy paste some sample code & voila!!

Here's the entire program that takes `test.eml` and converts it to PDF & HTML.

```
console.log(`I'm running...`);

const  EmlParser = require('eml-parser');
 const  fs = require('fs');
 
 let  emailFile = fs.createReadStream('./test.eml');

new  EmlParser(emailFile).convertEmailToStream('pdf')
.then(stream  => {
   stream.pipe(fs.createWriteStream(emailFile.path + '.pdf'));
})
.catch(err  => {
   console.log(err);
});

new EmlParser(fs.createReadStream('./test.eml'))
.getEmailAsHtml()
.then(htmlString  => {
	fs.writeFileSync('abc.html',htmlString)	;
})
.catch(err  => {
	console.log(err);
})
```
It works great.  It's easy.  I have a nice little converter so I can just simply view the email messages that I retrieve from my server.  **No one controls me!!** 🤓

Oh, let's take a look at the node_modules that were installed for this little program:

![4de15e10-152f-42ca-9918-cadb8c93977c-image.png](https://d1zd1hdbutccek.cloudfront.net/uploads/bf1e2694-a806-4f9f-a678-b608dbf544e6.png) 

![dizzy bear](https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExdDNyeGpoMWZoYnBhdXc0eWcwenJiMThuOHpsY3oxbHc4N2d0a2VpeCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/0U8DwMtUnGK0iaOb8J/giphy.gif)
