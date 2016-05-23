c=document.createElement 'canvas'
c.width=c.height=500
t=c.getContext '2d'
m=Math
b=m.PI/8
f=(w,l,x,y,a)->
	t.beginPath()
	t.moveTo x,y
	X=x+m.cos(a)*l
	Y=y+m.sin(a)*l
	t.lineWidth=w
	t.lineTo X,Y
	t.stroke()
	if w >= .1
		f w*3/4,l*3/4,X,Y,a+b
		f w*3/4,l*3/4,X,Y,a-b
f 10,90,250,0,m.PI/2

document.body.appendChild(c)
