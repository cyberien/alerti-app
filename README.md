Alerts: 
x Not sure if the 10% color vibe is working [Made them full color!]

Badges: 
- .badge-light-soft is broken...the color is way too light
- Soft badges should maybe just used the darkened color the way that alerts do?

Breadcrumbs: 
- Should have a .breadcrumb-#{color} version? I only really want the primary/dark/white/light versions?

Button groups:
- Have that dumb focus state, but so does every other theme?
- The .btn-group-vertical is rounded wrong, but I think if I update BS library it will fix
- Should fix .button-light so that it looks exactly the same as an addon in input groups :) Then it will work all well togehter

Cards: 
x The rounding on the accordion are wrong – seems like sometimes the border calc is off – fix this. [Updating to 4.1 fixed]
- Cards need $gray-200 divider that uses opacity, not just a hard number
- Fix card-header heights for button-sm, nav-tabs, titles, etc.

Carousel: 
- Fix the page indicators, the next/prev handles
- Captions kinda suck ass...but I don't really need this component at all?

List Groups: 
- Possibly make the color variants have a higher z-index like .active so can make it so they look good when surrounded by white cells

Pagination: 
- Do I want a transparent background? [easy to do with utility, just want sensible base one]

Tooltip: 
- Do I want a white background? Or just use the default? Gray is a little weird?

Navbars: 
x Might need to change structure to suit the underline active one? Or should I just relegate that to navs only? [Solved]
- Would love to allow for custom "margin-x" for .card-header-tabs


Other: 
- Would love to get input borders, dropdown borders, etc. colors to match $gray-300 by using rgba(78,105,167,.15) 