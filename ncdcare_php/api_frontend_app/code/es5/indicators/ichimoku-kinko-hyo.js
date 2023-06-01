/*
 Highstock JS v10.3.3 (2023-01-20)

 Indicator series type for Highcharts Stock

 (c) 2010-2021 Sebastian Bochan

 License: www.highcharts.com/license
*/
(function(e){"object"===typeof module&&module.exports?(e["default"]=e,module.exports=e):"function"===typeof define&&define.amd?define("highcharts/indicators/ichimoku-kinko-hyo",["highcharts","highcharts/modules/stock"],function(w){e(w);e.Highcharts=w;return e}):e("undefined"!==typeof Highcharts?Highcharts:void 0)})(function(e){function w(e,m,v,k){e.hasOwnProperty(m)||(e[m]=k.apply(null,v),"function"===typeof CustomEvent&&window.dispatchEvent(new CustomEvent("HighchartsModuleLoaded",{detail:{path:m,
module:e[m]}})))}e=e?e._modules:{};w(e,"Stock/Indicators/IKH/IKHIndicator.js",[e["Extensions/DataGrouping/ApproximationRegistry.js"],e["Core/Color/Color.js"],e["Core/Series/SeriesRegistry.js"],e["Core/Utilities.js"]],function(e,m,v,k){function w(b){return b.reduce(function(c,a){return Math.max(c,a[1])},-Infinity)}function G(b){return b.reduce(function(c,a){return Math.min(c,a[2])},Infinity)}function z(b){return{high:w(b),low:G(b)}}function H(b){var c,a,t,f,u;b.series.forEach(function(b){if(b.xData)for(f=
b.xData,u=a=b.xIncrement?1:f.length-1;0<u;u--)if(t=f[u]-f[u-1],"undefined"===typeof c||t<c)c=t});return c}function I(b,c,a,t){if(b&&c&&a&&t){var f=c.plotX-b.plotX;c=c.plotY-b.plotY;var u=t.plotX-a.plotX;t=t.plotY-a.plotY;var e=b.plotX-a.plotX,p=b.plotY-a.plotY;a=(-c*e+f*p)/(-u*c+f*t);u=(u*p-t*e)/(-u*c+f*t);if(0<=a&&1>=a&&0<=u&&1>=u)return{plotX:b.plotX+u*f,plotY:b.plotY+u*c}}}function E(b){var c=b.indicator;c.points=b.points;c.nextPoints=b.nextPoints;c.color=b.color;c.options=B(b.options.senkouSpan.styles,
b.gap);c.graph=b.graph;c.fillGraph=!0;v.seriesTypes.sma.prototype.drawGraph.call(c)}var J=this&&this.__extends||function(){var b=function(c,a){b=Object.setPrototypeOf||{__proto__:[]}instanceof Array&&function(a,f){a.__proto__=f}||function(a,f){for(var c in f)Object.prototype.hasOwnProperty.call(f,c)&&(a[c]=f[c])};return b(c,a)};return function(c,a){function t(){this.constructor=c}if("function"!==typeof a&&null!==a)throw new TypeError("Class extends value "+String(a)+" is not a constructor or null");
b(c,a);c.prototype=null===a?Object.create(a):(t.prototype=a.prototype,new t)}}(),C=m.parse,F=v.seriesTypes.sma,K=k.defined;m=k.extend;var L=k.isArray,M=k.isNumber,B=k.merge,N=k.objectEach;k=function(b){function c(){var a=null!==b&&b.apply(this,arguments)||this;a.data=[];a.options={};a.points=[];a.graphCollection=[];return a}J(c,b);c.prototype.init=function(){b.prototype.init.apply(this,arguments);this.options=B({tenkanLine:{styles:{lineColor:this.color}},kijunLine:{styles:{lineColor:this.color}},
chikouLine:{styles:{lineColor:this.color}},senkouSpanA:{styles:{lineColor:this.color,fill:C(this.color).setOpacity(.5).get()}},senkouSpanB:{styles:{lineColor:this.color,fill:C(this.color).setOpacity(.5).get()}},senkouSpan:{styles:{fill:C(this.color).setOpacity(.2).get()}}},this.options)};c.prototype.toYData=function(a){return[a.tenkanSen,a.kijunSen,a.chikouSpan,a.senkouSpanA,a.senkouSpanB]};c.prototype.translate=function(){v.seriesTypes.sma.prototype.translate.apply(this);for(var a=0,c=this.points;a<
c.length;a++)for(var f=c[a],b=0,e=this.pointArrayMap;b<e.length;b++){var p=e[b],q=f[p];M(q)&&(f["plot"+p]=this.yAxis.toPixels(q,!0),f.plotY=f["plot"+p],f.tooltipPos=[f.plotX,f["plot"+p]],f.isNull=!1)}};c.prototype.drawGraph=function(){var a=this,c=a.points,f=a.options,b=a.graph,e=a.color,p={options:{gapSize:f.gapSize}},q=a.pointArrayMap.length,g=[[],[],[],[],[],[]],n={tenkanLine:g[0],kijunLine:g[1],chikouLine:g[2],senkouSpanA:g[3],senkouSpanB:g[4],senkouSpan:g[5]},d=[],r=a.options.senkouSpan,k=r.color||
r.styles.fill,D=r.negativeColor,m=[[],[]],x=[[],[]];r=c.length;var w=0,y,z,A;for(a.ikhMap=n;r--;){var h=c[r];for(y=0;y<q;y++){var l=a.pointArrayMap[y];K(h[l])&&g[y].push({plotX:h.plotX,plotY:h["plot"+l],isNull:!1})}D&&r!==c.length-1&&(l=n.senkouSpanB.length-1,h=I(n.senkouSpanA[l-1],n.senkouSpanA[l],n.senkouSpanB[l-1],n.senkouSpanB[l]))&&(h={plotX:h.plotX,plotY:h.plotY,isNull:!1,intersectPoint:!0},n.senkouSpanA.splice(l,0,h),n.senkouSpanB.splice(l,0,h),d.push(l))}N(n,function(c,b){f[b]&&"senkouSpan"!==
b&&(a.points=g[w],a.options=B(f[b].styles,p),a.graph=a["graph"+b],a.fillGraph=!1,a.color=e,v.seriesTypes.sma.prototype.drawGraph.call(a),a["graph"+b]=a.graph);w++});if(a.graphCollection)for(q=0,r=a.graphCollection;q<r.length;q++)l=r[q],a[l].destroy(),delete a[l];a.graphCollection=[];if(D&&n.senkouSpanA[0]&&n.senkouSpanB[0]){d.unshift(0);d.push(n.senkouSpanA.length-1);for(r=0;r<d.length-1;r++){l=d[r];h=d[r+1];q=n.senkouSpanB.slice(l,h+1);l=n.senkouSpanA.slice(l,h+1);if(1<=Math.floor(q.length/2))if(h=
Math.floor(q.length/2),q[h].plotY===l[h].plotY){for(A=y=h=0;A<q.length;A++)h+=q[A].plotY,y+=l[A].plotY;h=h>y?0:1}else h=q[h].plotY>l[h].plotY?0:1;else h=q[0].plotY>l[0].plotY?0:1;m[h]=m[h].concat(q);x[h]=x[h].concat(l)}["graphsenkouSpanColor","graphsenkouSpanNegativeColor"].forEach(function(c,b){m[b].length&&x[b].length&&(z=0===b?k:D,E({indicator:a,points:m[b],nextPoints:x[b],color:z,options:f,gap:p,graph:a[c]}),a[c]=a.graph,a.graphCollection.push(c))})}else E({indicator:a,points:n.senkouSpanB,nextPoints:n.senkouSpanA,
color:k,options:f,gap:p,graph:a.graphsenkouSpan}),a.graphsenkouSpan=a.graph;delete a.nextPoints;delete a.fillGraph;a.points=c;a.options=f;a.graph=b;a.color=e};c.prototype.getGraphPath=function(a){var c=[],b;a=a||this.points;if(this.fillGraph&&this.nextPoints){if((b=v.seriesTypes.sma.prototype.getGraphPath.call(this,this.nextPoints))&&b.length){b[0][0]="L";c=v.seriesTypes.sma.prototype.getGraphPath.call(this,a);b=b.slice(0,c.length);for(var e=b.length-1;0<=e;e--)c.push(b[e])}}else c=v.seriesTypes.sma.prototype.getGraphPath.apply(this,
arguments);return c};c.prototype.getValues=function(a,c){var b=c.period,e=c.periodTenkan;c=c.periodSenkouSpanB;var t=a.xData,p=a.yData,q=p&&p.length||0;a=H(a.xAxis);var g=[],n=[],d;if(!(t.length<=b)&&L(p[0])&&4===p[0].length){var r=t[0]-b*a;for(d=0;d<b;d++)n.push(r+d*a);for(d=0;d<q;d++){if(d>=e){var k=p.slice(d-e,d);k=z(k);k=(k.high+k.low)/2}if(d>=b){var m=p.slice(d-b,d);m=z(m);m=(m.high+m.low)/2;var w=(k+m)/2}if(d>=c){var x=p.slice(d-c,d);x=z(x);x=(x.high+x.low)/2}r=p[d][3];var v=t[d];"undefined"===
typeof g[d]&&(g[d]=[]);"undefined"===typeof g[d+b-1]&&(g[d+b-1]=[]);g[d+b-1][0]=k;g[d+b-1][1]=m;g[d+b-1][2]=void 0;"undefined"===typeof g[d+1]&&(g[d+1]=[]);g[d+1][2]=r;d<=b&&(g[d+b-1][3]=void 0,g[d+b-1][4]=void 0);"undefined"===typeof g[d+2*b-2]&&(g[d+2*b-2]=[]);g[d+2*b-2][3]=w;g[d+2*b-2][4]=x;n.push(v)}for(d=1;d<=b;d++)n.push(v+d*a);return{values:g,xData:n,yData:g}}};c.defaultOptions=B(F.defaultOptions,{params:{index:void 0,period:26,periodTenkan:9,periodSenkouSpanB:52},marker:{enabled:!1},tooltip:{pointFormat:'<span style="color:{point.color}">\u25cf</span> <b> {series.name}</b><br/>TENKAN SEN: {point.tenkanSen:.3f}<br/>KIJUN SEN: {point.kijunSen:.3f}<br/>CHIKOU SPAN: {point.chikouSpan:.3f}<br/>SENKOU SPAN A: {point.senkouSpanA:.3f}<br/>SENKOU SPAN B: {point.senkouSpanB:.3f}<br/>'},
tenkanLine:{styles:{lineWidth:1,lineColor:void 0}},kijunLine:{styles:{lineWidth:1,lineColor:void 0}},chikouLine:{styles:{lineWidth:1,lineColor:void 0}},senkouSpanA:{styles:{lineWidth:1,lineColor:void 0}},senkouSpanB:{styles:{lineWidth:1,lineColor:void 0}},senkouSpan:{styles:{fill:"rgba(255, 0, 0, 0.5)"}},dataGrouping:{approximation:"ichimoku-averages"}});return c}(F);m(k.prototype,{pointArrayMap:["tenkanSen","kijunSen","chikouSpan","senkouSpanA","senkouSpanB"],pointValKey:"tenkanSen",nameComponents:["periodSenkouSpanB",
"period","periodTenkan"]});e["ichimoku-averages"]=function(){var b=[],c;[].forEach.call(arguments,function(a,k){b.push(e.average(a));c=!c&&"undefined"===typeof b[k]});return c?void 0:b};v.registerSeriesType("ikh",k);"";return k});w(e,"masters/indicators/ichimoku-kinko-hyo.src.js",[],function(){})});
//# sourceMappingURL=ichimoku-kinko-hyo.js.map