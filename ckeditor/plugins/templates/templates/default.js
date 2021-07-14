/*
Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.addTemplates('default', {
    imagesPath: CKEDITOR.getUrl(CKEDITOR.plugins.getPath('templates') + 'templates/images/'),
    templates: [
        { title: '2 Cột (50% - 50%)', image: 'template2.gif', description: 'Desktop,table: 2 cột (50% - 50%) | Mobile: 1 cột', html: '<div class="row"><div class="col-sm-6">Nội dung cột 1</div><div class="col-sm-6">Nội dung cột 2</div></div>' },
        { title: '2 Cột (50% - 50%)', image: 'template2.gif', description: 'Desktop,table: 2 cột (50% - 50%) | Mobile: 2 cột', html: '<div class="row"><div class="col-sm-6 col-xs-6">Nội dung cột 1</div><div class="col-sm-6 col-xs-6">Nội dung cột 2</div></div>' },
        { title: '2 Cột (50% - 70%)', image: 'template2.gif', description: 'Desktop,table: 2 cột (50% - 70%) | Mobile: 1 cột', html: '<div class="row"><div class="col-sm-5">Nội dung cột 1</div><div class="col-sm-7">Nội dung cột 2</div></div>' },
        { title: '2 Cột (40% - 80%)', image: 'template2.gif', description: 'Desktop,table: 2 cột (40% - 80%) | Mobile: 1 cột', html: '<div class="row"><div class="col-sm-4">Nội dung cột 1</div><div class="col-sm-8">Nội dung cột 2</div></div>' },
        { title: '2 Cột (30% - 90%)', image: 'template2.gif', description: 'Desktop,table: 2 cột (30% - 90%) | Mobile: 1 cột', html: '<div class="row"><div class="col-sm-3">Nội dung cột 1</div><div class="col-sm-9">Nội dung cột 2</div></div>' },
        { title: '2 Cột (70% - 50%)', image: 'template2.gif', description: 'Desktop,table: 2 cột (70% - 50%) | Mobile: 1 cột', html: '<div class="row"><div class="col-sm-7">Nội dung cột 1</div><div class="col-sm-5">Nội dung cột 2</div></div>' },
        { title: '2 Cột (80% - 40%)', image: 'template2.gif', description: 'Desktop,table: 2 cột (80% - 40%) | Mobile: 1 cột', html: '<div class="row"><div class="col-sm-8">Nội dung cột 1</div><div class="col-sm-4">Nội dung cột 2</div></div>' },
        { title: '2 Cột (90% - 30%)', image: 'template2.gif', description: 'Desktop,table: 2 cột (90% - 30%) | Mobile: 1 cột', html: '<div class="row"><div class="col-sm-9">Nội dung cột 1</div><div class="col-sm-3">Nội dung cột 2</div></div>' },
        { title: '3 Cột (33% - 33% - 33%)', image: 'template2.gif', description: 'Desktop,table: 3 cột (33% - 33% -  33%) | Mobile: 1 cột', html: '<div class="row"><div class="col-sm-4">Nội dung cột 1</div><div class="col-sm-4">Nội dung cột 2</div><div class="col-sm-4">Nội dung cột 3</div></div>' },
        { title: '3 Cột (25% - 50% - 25%)', image: 'template2.gif', description: 'Desktop,table: 3 cột (25% - 50%- 25%) | Mobile: 1 cột', html: '<div class="row"><div class="col-sm-3">Nội dung cột 1</div><div class="col-sm-6">Nội dung cột 2</div><div class="col-sm-3">Nội dung cột 3</div></div>' },
        { title: '3 Cột (50% - 25% - 25%)', image: 'template2.gif', description: 'Desktop,table: 3 cột (50% - 25%- 25%) | Mobile: 1 cột', html: '<div class="row"><div class="col-sm-6">Nội dung cột 1</div><div class="col-sm-3">Nội dung cột 2</div><div class="col-sm-3">Nội dung cột 3</div></div>' },
        { title: '3 Cột (25% - 25% - 50%)', image: 'template2.gif', description: 'Desktop,table: 3 cột (25% - 25%- 50%) | Mobile: 1 cột', html: '<div class="row"><div class="col-sm-3">Nội dung cột 1</div><div class="col-sm-3">Nội dung cột 2</div><div class="col-sm-6">Nội dung cột 3</div></div>' },

        { title: '4 Cột (25% - 25% - 25% - 25%)', image: 'template2.gif', description: 'Desktop,table: 4 cột (25% - 25% - 25% - 25%) | Mobile: 1 cột', html: '<div class="row"><div class="col-sm-3">Nội dung cột 1</div><div class="col-sm-3">Nội dung cột 2</div><div class="col-sm-3">Nội dung cột 3</div><div class="col-sm-4">Nội dung cột 4</div></div>' },
        { title: '6 Cột (16% - 16% - 16% - 16% - 16% - 16%)', image: 'template2.gif', description: 'Desktop,table: 6 cột (16% - 16% - 16% - 16% - 16% - 16%) | Mobile: 1 cột', html: '<div class="row"><div class="col-sm-2">Nội dung cột 1</div><div class="col-sm-2">Nội dung cột 2</div><div class="col-sm-2">Nội dung cột 3</div><div class="col-sm-2">Nội dung cột 4</div><div class="col-sm-2">Nội dung cột 5</div><div class="col-sm-2">Nội dung cột 6</div></div>' },

    ]
});
