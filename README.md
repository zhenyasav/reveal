# Reveal

Surround something with the `{{#reveal}} ... {{/reveal}}` helper.

The content will be rendered and shown in an animated way whenever the data context changes.

## Options

### Transitions

```{{#reveal transition="fade slide"}}```

Supply a CSS class list to the transition property to control which transition types are going to be used. `fade` and `slide` are default, their definition is in [reveal.less](reveal.less) for reference so that you may develop your own. To turn off transitions, simply pass an empty string.

### Data context

```{{#reveal data=some_data_value}}```

When supplying a custom transition, use the data parameter to ensure the data context is the intended value instead of the parameters(hash) object itself.
