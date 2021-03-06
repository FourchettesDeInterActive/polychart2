@examples ?= {}

@examples.line = (dom) ->
  jsondata = ({index:i, value:Math.random()*10} for i in [0..10])
  data = polyjs.data data:jsondata
  spec = {
    layers: [
      { data: data, type: 'line', x : 'index', y : 'value', 'color': 'index'}
      { data: data, type: 'point', x : 'index', y : 'value', id: 'index'}
    ]
    guides:
      y :
        type:'num', min:0, max:10, ticks:[2,4,6,8],
        labels:{2: 'Two', 4:'Four', 6:'Six', 8:'Eight'}
    dom: dom
  }
  c = polyjs.chart spec

  redraw = () ->
    jsondata.shift()
    jsondata.push({index:i++, value:Math.random()*10})
    spec.layers[0].data.update data:jsondata
    c.make spec
    setTimeout(redraw, 1000)
  setTimeout(redraw, 1000)

@examples.line_missing2 = (dom) ->
  data = polyjs.data data: [
    {a: 2, b: null}
    {a: undefined, b: 7}
    {a: 9, b: null}
    {a: 5}
    {a: null, b: 3}
    {a: undefined, b: null}
  ]
  polyjs.chart
    layer:
      data:data, type:'line', x:'a', y:'b'
    dom:dom


@examples.line_missing = (dom) ->
  data = polyjs.data data: [
    {a: 2, b: 4}
    {a: 3, b: 7}
    {a: 9, b: 10}
    {a: 5}
    {a: null, b: 3}
    {a: undefined, b: null}
  ]
  polyjs.chart
    layer:
      data:data, type:'line', x:'a', y:'b'
    dom:dom


@examples.line_sum = (dom) ->
  i = 0; s = 0
  next = () ->
    v = Math.random()*10
    s += v
    {index:i++, value:v, total:s}
  jsondata = (next() for i in [0..10])
  data = polyjs.data data:jsondata
  spec = {
    layers: [
      { data: data, type: 'line', x : 'index', y : 'total'}
      { data: data, type: 'point', x : 'index', y : 'total', id: 'index'}
    ]
    guides:
      y: min:0
    dom: dom
  }
  c = polyjs.chart spec

  redraw = () ->
    jsondata.shift()
    jsondata.push(next())
    spec.layers[0].data.update data:jsondata
    c.make spec
    setTimeout(redraw, 1000)
  setTimeout(redraw, 1000)

@examples.line_flip = (dom) ->
  jsondata = ({index:i, value:Math.random()*10} for i in [0..10])
  data = polyjs.data data:jsondata
  spec = {
    layers: [
      { data: data, type: 'line', x : 'index', y : 'value'}
      { data: data, type: 'point', x : 'index', y : 'value', id: 'index'}
    ]
    guides:
      y :
        type:'num', min:0, max:10, ticks:[2,4,6,8],
        labels:{2: 'Two', 4:'Four', 6:'Six', 8:'Eight'}
    coord:
      type: 'cartesian'
      flip: true
    dom: dom
  }
  c = polyjs.chart spec

  redraw = () ->
    jsondata.shift()
    jsondata.push({index:i++, value:Math.random()*10})
    spec.layers[0].data.update data:jsondata
    c.make spec
    setTimeout(redraw, 1000)
  setTimeout(redraw, 1000)

@examples.line_polar = (dom) ->
  jsondata = ({index:i, value:Math.random()*10} for i in [0..10])
  data = polyjs.data data:jsondata
  spec = {
    layers: [
      { data: data, type: 'line', x : 'index', y : 'value'}
      { data: data, type: 'point', x : 'index', y : 'value', id: 'index'}
    ]
    guides:
      y :
        type:'num', min:0, max:10, ticks:[2,4,6,8],
        labels:{2: 'Two', 4:'Four', 6:'Six', 8:'Eight'}
    coord: { type: 'polar'  }
    dom: dom
  }
  c = polyjs.chart spec

  redraw = () ->
    jsondata.shift()
    jsondata.push({index:i++, value:Math.random()*10})
    spec.layers[0].data.update data:jsondata
    c.make spec
    setTimeout(redraw, 1000)
  setTimeout(redraw, 1000)

@examples.line_polar_log = (dom) ->
  jsondata = ({index:i, value:Math.random()*10} for i in [1..10])
  data = polyjs.data data:jsondata
  spec = {
    layers: [
      { data: data, type: 'line', x : 'index', y : 'value'}
      { data: data, type: 'point', x : 'index', y : 'value', id: 'index'}
    ]
    guides:
      y :
        type:'num', min:0, max:10, ticks:[2,4,6,8],
        labels:{2: 'Two', 4:'Four', 6:'Six', 8:'Eight'}
      x:
        scale: {type:'log'}
    coord: { type: 'polar'  }
    dom: dom
  }
  c = polyjs.chart spec

  redraw = () ->
    jsondata.shift()
    jsondata.push({index:i++, value:Math.random()*10})
    spec.layers[0].data.update data:jsondata
    c.make spec
    setTimeout(redraw, 1000)
  setTimeout(redraw, 1000)

@examples.line_polar_flip = (dom) ->
  jsondata = ({index:i, value:Math.random()*10} for i in [0..10])
  data = polyjs.data data:jsondata
  spec = {
    layers: [
      { data: data, type: 'line', x : 'index', y : 'value'}
      { data: data, type: 'point', x : 'index', y : 'value', id: 'index'}
    ]
    guides:
      y :
        type:'num', min:0, max:10, ticks:[2,4,6,8],
        labels:{2: 'Two', 4:'Four', 6:'Six', 8:'Eight'}
    coord: { type: 'polar', flip:true }
    dom: dom
  }
  c = polyjs.chart spec

  redraw = () ->
    jsondata.shift()
    jsondata.push({index:i++, value:Math.random()*10})
    spec.layers[0].data.update data:jsondata
    c.make spec
    setTimeout(redraw, 1000)
  setTimeout(redraw, 1000)

@examples.line_static = (dom) ->
  jsondata = [
    {a:1,b:5,c:'A'},{a:3,b:4,c:'A'},{a:2,b:3,c:'A'}
    {a:2,b:2,c:'B'},{a:1,b:4,c:'B'},{a:2.2,b:3,c:'B'},{a:3,b:3,c:'B'}
  ]
  data = polyjs.data data:jsondata
  spec = {
    layers: [
      { data: data, type: 'line', x : 'a', y : 'b', color:'c'}
    ]
    dom: dom
  }
  c = polyjs.chart spec

@examples.line_date = (dom) ->
  jsondata = [
    {a:'2012-01-01',b:5,c:'A'},
    {a:'2012-01-02',b:6,c:'A'},
    {a:'2012-01-03',b:3,c:'A'}
    {a:'2012-01-04',b:2,c:'B'},
    {a:'2012-01-05',b:4,c:'B'},
    {a:'2012-01-06',b:3,c:'B'},
    {a:'2012-01-07',b:3,c:'B'}
  ]
  data = polyjs.data data:jsondata
  spec = {
    layers: [
      { data: data, type: 'path', x : 'a', y : 'b'}
    ]
    dom: dom
  }
  c = polyjs.chart spec

@examples.path = (dom) ->
  jsondata = [
    {a:1,b:5,c:'A'},{a:3,b:4,c:'A'},{a:2,b:3,c:'A'}
    {a:2,b:2,c:'B'},{a:1,b:4,c:'B'},{a:2.2,b:3,c:'B'},{a:3,b:3,c:'B'}
  ]
  data = polyjs.data data:jsondata
  spec = {
    layers: [
      { data: data, type: 'path', x : 'a', y : 'b', color:'c'}
      { data: data, type: 'point', x : 'a', y : 'b', color:'c'}
    ]
    dom: dom
  }
  c = polyjs.chart spec
