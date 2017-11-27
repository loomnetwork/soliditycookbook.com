import 'main.scss';
import hljs from 'highlight.js'
import hljsDefineSolidity from 'highlightjs-solidity'
import 'highlight.js/styles/atom-one-dark.css'

hljsDefineSolidity(hljs);
hljs.initHighlightingOnLoad();
