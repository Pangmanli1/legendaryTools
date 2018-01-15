# legendaryTools
### A set of common tools used in iOS project



## How to use this autoLayout select labels (如何使用多选标签)
```
NSArray * items = @[@"问题优化",@"bug", @"积分相关",@"信息安全问题",@"提现困难", @"如何使用积分帮助"];

MLAutoLaySelectLabelsView * selectView = [[MLAutoLaySelectLabelsView alloc]initWithFrame:CGRectMake(20, 200, SCREEN_WIDTH - 2 * 20, 100) items:items];

[self.view addSubview:selectView];

```
## Two references to change the gaps (调整各间距)

```
//以下两项可根据需求调整 (The two items below are adjustable to get the right UI)
//The gap between the edge of button and its label edge
CGFloat btnLabelMargin = GetLogicPixelX(10);

//水平间隙(按 5个宽度为110px的按钮计算,可调整)
//The gap between each button
CGFloat gapX = (SCREEN_WIDTH - GetLogicPixelX(20) * 4 - buttonW * 5 - marginX * 2)/4.0;

```
## Attached Tools --  NSString+SizeFormat   &&  UIImage+SizeColor

### NSString + SizeFormat

    * The regular expression to validate data (正则判断)
    * A simple way to get the right size of given font text (指定字体大小,及指定字数的文字所占尺寸)
    * Some date formatted string  (转换成对应日期格式的字符串)

### UIImage+SizeColor

    * Resize a image by slice on a location of the image (切割图片 然后拉伸,一般从中间切割,保证边缘倒角不被拉伸)
    * Generate a image with the color  (用颜色创建一张该颜色的图片)
    * Blur a image (模糊图片)
  
  
