# Reveal

A Meteor package to animate data context changes. (Demo)[http://reveal.zhenya.co].

## Usage

Surround something with the `{{#reveal}} ... {{/reveal}}` helper to animate it when the data context changes. 

## Options

### Data context

Supply a specific data context as a positional argument

```{{#reveal something}}...{{/reveal}}```

### Transitions

```{{#reveal transition="fade slide"}}```

Supply a CSS class list to the transition property to control which transition types are going to be used. `fade` and `slide` are default, their definition is in [reveal.less](reveal.less) for reference so that you may develop your own. To turn off transitions, simply pass an empty string.

When supplying a custom transition, use the data parameter to ensure the data context is the intended value instead of the parameters (hash) object itself.

```{{#reveal transition="fade slide" data=something}}```


