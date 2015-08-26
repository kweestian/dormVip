/*!
 * classie - class helper functions
 * from bonzo https://github.com/ded/bonzo
 * 
 * classie.has( elem, 'my-class' ) -> true/false
 * classie.add( elem, 'my-new-class' )
 * classie.remove( elem, 'my-unwanted-class' )
 * classie.toggle( elem, 'my-class' )
 */

/*jshint browser: true, strict: true, undef: true */
/*global define: false */

function classRe (name) {
  return new RegExp('(^|\\b)' + name.split(' ').join('|') + '(\\b|$)', 'gi')
}
function hasClass (el, name) {
  return el.classList
    ? el.classList.contains(name)
    : classRe(name).test(el.className)
}
function addClass (el, name) {
  if (el.classList) {
    el.classList.add(name)
    return el
  }
  el.className += ' ' + name
  return el
}
function removeClass (el, name) {
  if (el.classList) {
    el.classList.remove(name)
    return el
  }
  el.className = el.className.replace(classRe(name), ' ')
  return el
}
function toggleClass( el, name ) {
  if (el.classList && hasClass(el, name)) {
    removeClass} else if (el.classList && !hasClass(el, name)) {
      addClass
    }
} 


(function(f) {
  if (typeof exports === "object" && typeof module !== "undefined") {
    module.exports = f()
  } else if (typeof define === "function" && define.amd) {
    define([], f)
  } else {
    var g;
    if (typeof window !== "undefined") {
      g = window
    } else if (typeof global !== "undefined") {
      g = global
    } else if (typeof self !== "undefined") {
      g = self
    } else {
      g = this
    }
    g.classie = f()
  }
})(function () {
  return {
    has: hasClass,
    hasClass: hasClass,
    add: addClass,
    addClass: addClass,
    remove: removeClass,
    removeClass: removeClass,
    toggle: toggleClass,
    toggleClass: toggleClass,
  }
})


