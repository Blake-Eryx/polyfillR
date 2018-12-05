#' Takes an SVG polygon and partially fills it with a color.
#' Returns a list containgin a character vector of an 'img' block that can be embedded into HTML output and the SVG text.
#' @param fillPercentage An integer. How much to fill the polygon.
#' @param shapeName A character vector. The internal name to assign to this polygon.
#' @param viewBoxDimensions A character vector. The view box dimensions of the SVG (e.g., "0 0 24 24").
#' @param pathSvg A character vector. The SVG path data (can contain multiple paths and objects that are meant to be grouped together).
#' @param extraSvg Any extra SVG rendering commands to add to the output.
#' @param fillColor A character vector. The color to fill it with. Can be any valid SVG color value (e.g., "#FF0000", "red")
#' @param emptyColor A character vector. The background color of the polygon, indicating the portion of it that is "empty.'
#' @param size A character vector. The size of the SVG output. Can be any valid HTML size argument (e.g., "64px" or "50\%").
#' @author Blake Eryx
filled_polygon <- function(fillPercentage, shapeName, viewBoxDimensions, pathSvg,
                           extraSvg = "", fillColor = "red", emptyColor = "#D9D9D9", size = "128px")
    {
    Svg <- sprintf(
    "<svg version='1.1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' x='0px' y='0px' viewBox='%s' enable-background='new %s' xml:space='preserve'>
    <defs>

    <g>
    	<clipPath id='%s'>
    	%s
    	</clipPath>
    </g>

    </defs>
    %s
    <rect x='0' y='0' fill='%s' width='100%%' height='100%%' clip-path='url(#%s)' />
    <rect x='0%%' y='%d%%' fill='%s' width='100%%' height='100%%' clip-path='url(#%s)' />

    </svg>",
    viewBoxDimensions, viewBoxDimensions, shapeName, pathSvg, extraSvg, emptyColor, shapeName, 100-fillPercentage, fillColor, shapeName)

    Image <- sprintf("<img src='data:image/svg+xml;base64,%s' width='%s'/>", openssl::base64_encode(Svg), size)

    list(Image=Image, Svg=Svg)
    }

#' Creates a female silhouette image, partially filled with a color.
#' Returns a list containgin a character vector of an 'img' block that can be embedded into HTML output and the SVG text.
#' @note Based on SVG from https://openclipart.org/detail/249446/female-symbol-silhouette.
#' @param fillPercentage An integer. How much to fill the polygon.
#' @param fillColor A character vector. The color to fill it with. Can be any valid SVG color value (e.g., "#FF0000", "red"). Default is light pink.
#' @param emptyColor A character vector. The background color of the polygon, indicating the portion of it that is "empty.'
#' @param size A character vector. The size of the SVG output. Can be any valid HTML size argument (e.g., "64px" or "50\%").
#' @param includePercentLabel A logical. Whether to include a label in the top left corner showing the percent that the polygon if filled.
#' @examples
#' female_polygon(50, "green", "256px")
#' @author Blake Eryx
female_polygon <- function(fillPercentage, fillColor = "#ffa7b6", emptyColor = "#D9D9D9", size = "128px", includePercentLabel=T)
    {
    textLabel <- ifelse(includePercentLabel,
                        sprintf("<text x='600' y='85' style='font: 100px sans-serif; fill: %s;'>%d%%</text>", fillColor, fillPercentage),
                        "")
    filled_polygon(fillPercentage=fillPercentage, shapeName='female',
                viewBoxDimensions="0 0 847 1684",
                pathSvg= "<path d='M779.803,905.6337c-4.906,17.6151-17.4805,29.8795-36.8879,35.3109c-31.3215,8.7738-54.4355-4.9732-66.7133-33.6936   l-103.938-356.2625c-0.7545-2.6145-4.5417-2.3718-4.9596,0.3236l-20.863,134.2757c-3.3019,21.2539-1.6712,42.9794,4.7711,63.5056   l142.3214,453.8254c7.7766,24.7986-10.7549,50.0282-36.7529,50.0282h-98.9512c-5.9164,0-10.9435,4.3802-11.7523,10.2428   l-46.4027,336.2485c-3.3559,24.394-24.2054,42.5616-48.8287,42.5616h-54.6915c-24.6233,0-45.4728-18.1676-48.8287-42.5616   l-46.4027-336.2485c-0.8088-5.8625-5.8224-10.2428-11.7523-10.2428h-98.9515c-25.9977,0-44.5292-25.2296-36.753-50.0282   l142.3218-453.8254c6.4422-20.5262,8.073-42.2517,4.7711-63.5056l-20.8495-134.2757c-0.4179-2.6954-4.2051-2.9381-4.9731-0.3236   L170.7982,907.251c-12.2781,28.7204-35.3917,42.4674-66.7133,33.6936c-19.4074-5.4315-31.9819-17.6959-36.8879-35.3109   c-2.9515-10.6202-2.4392-21.9008,0.9167-32.3862L225.4223,380.553c10.8089-33.8821,42.292-56.8747,77.8591-56.8747h240.4507   c35.5533,0,67.0367,22.9926,77.8456,56.8747l157.3085,492.6945C782.2421,883.7328,782.7545,895.0135,779.803,905.6337z'/>
    	<circle cx='423.5' cy='172.9557' r='130.9557'/>",
    	extraSvg=textLabel,
        fillColor=fillColor, emptyColor=emptyColor, size=size)
    }

#' Creates a male silhouette image, partially filled with a color.
#' Returns a list containgin a character vector of an 'img' block that can be embedded into HTML output and the SVG text.
#' @note Based on SVG from https://openclipart.org/detail/249447/male-symbol-silhouette.
#' @param fillPercentage An integer. How much to fill the polygon.
#' @param fillColor A character vector. The color to fill it with. Can be any valid SVG color value (e.g., "#FF0000", "red"). Default is light blue.
#' @param emptyColor A character vector. The background color of the polygon, indicating the portion of it that is "empty.'
#' @param size A character vector. The size of the SVG output. Can be any valid HTML size argument (e.g., "64px" or "50\%").
#' @param includePercentLabel A logical. Whether to include a label in the top left corner showing the percent that the polygon if filled.
#' @examples
#' male_polygon(50, "green", "256px")
#' @author Blake Eryx
male_polygon <- function(fillPercentage, fillColor = "#3a9fbf", emptyColor = "#D9D9D9", size = "128px", includePercentLabel=T)
    {
    textLabel <- ifelse(includePercentLabel,
                        sprintf("<text x='600' y='85' style='font: 100px sans-serif; fill: %s;'>%d%%</text>", fillColor, fillPercentage),
                        "")
    filled_polygon(fillPercentage=fillPercentage, shapeName='male',
                viewBoxDimensions="0 0 847 1684",
                pathSvg= "<path d='M801.3882,925.212c-4.1222,17.1665-14.6907,29.3257-30.4462,35.1493c-25.9366,9.5861-46.9487-1.978-59.9796-24.6365   c-2.2269-3.8456-3.9421-7.9816-5.2701-12.2144l-96.4429-305.9421c-1.7014-5.3809-9.6276-4.288-9.7938,1.3694L593.881,805.087   l106.3336,797.895c3.7487,28.2191-18.1904,53.2844-46.6586,53.2844h-65.1804c-23.7371,0-43.7536-17.6509-46.7137-41.1945   l-89.803-714.0814l-89.8032,714.0814c-2.9602,23.5436-22.9764,41.1945-46.6999,41.1945h-65.1806   c-28.4682,0-50.4208-25.0653-46.6583-53.2844l106.3334-797.895l-5.5747-186.1494c-0.166-5.6574-8.106-6.7503-9.7936-1.3694   l-96.4429,305.9421c-1.3418,4.2328-3.0572,8.3688-5.2704,12.2144c-13.0443,22.6584-34.0566,34.2225-59.9794,24.6365   c-15.7695-5.8236-26.324-17.9828-30.4601-35.1493c-2.5452-10.61-2.0059-21.7316,1.0236-32.2169l138.4257-479.3928   c13.0031-45.0538,54.2389-76.067,101.1324-76.067h217.9096c46.8934,0,88.1293,31.0132,101.1321,76.067l138.4258,479.3928   C803.4078,903.4804,803.9474,914.6019,801.3882,925.212z'/>
	<circle cx='451.8644' cy='185.3735' r='129.107'/>",
	    extraSvg=textLabel,
        fillColor=fillColor, emptyColor=emptyColor, size=size)
    }
