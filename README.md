RandomImageLayout
=================

##This is the original layout in iPhoto journal:
<img src="https://github.com/aceisScope/RandomImageLayout/raw/master/example.png"/> 
##This is how RandomImageLayout imitates:
<img src="https://github.com/aceisScope/RandomImageLayout/raw/master/screenshot.png"/> 
</div>

##Description
=================
The idea of this layout is inspired by <a href="https://github.com/alariccole">Alaric Cole</a>. It is based on the discussion of <a href="https://github.com/aceisScope/WaterflowView/issues/4">WaterflowView issue4</a> , about how to make a kind of layout that will not restrain the natural size of images.
iPhoto journal layout is no doubt a masterpiece, and I cannot declare that I have made a total substitute for it. What I am doing here, is simply to show the possibility of this method and hope it may slightly shed some light on other brains far smarter than mine.

##How this layout works
===================
As the iPhoto example above shows, every image in the layout, is based on a basic square, the size of which is 40*40 (iPhone screen), and 7 squares form one row. So if we know how much weight an image should have, then sum the weight of images until it's divisible by 7.
In this layout, I have 4 kinds of weight: 1,2,4,9, and each takes square space of the equal number.

##How to use
=================
LayoutCell is a subclass of UITableViewCell, so the only thing needed is to [cell layoutWithWeightArray:array], and the array should be a NSArray for NSDictionary with WEIGHT and IMAGE as keys.
As for how to decide how much weight an image should get, that's still a remaining subject. 
The image array in the project are only for test. Normally the array for each cell's initialization don't necessarily need to be 7-divisible in weight.

##License
=================
This is available under the MIT license. See LICENSE.rtf.

