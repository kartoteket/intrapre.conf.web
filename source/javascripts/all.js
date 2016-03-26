/**
 * style section headings
 */
$$('.section-title h4').forEach(function(h4){

    var text = h4.textContent.split(/[\s-]/)
      , lastWord = text.pop();
    h4.textContent = text.join(' ');
    h4._.set({
        contents: {
            tag: "span",
            class: 'color-primary',
            textContent: ' ' + lastWord
        }
    });
});
