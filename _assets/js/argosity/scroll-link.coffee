window.Argosity ||= {}

DEFAULT_DURATION = 750 # milliseconds

EASE_IN_OUT = (t) ->
    if t < .5 then 4 * t * t * t else (t - 1) * (2 * t - 2) * (2 * t - 2) + 1

POSITION = (start, end, elapsed, duration) ->
    if (elapsed > duration)
        end
    else
        start + (end - start) * EASE_IN_OUT(elapsed / duration)


class window.Argosity.ScrollLink

    constructor: (link, destination, @options = {}) ->
        @destination = document.querySelector(destination)
        @link = document.querySelector(link)
        if @link and @destination
            @link.addEventListener 'click', => @scrollToElement()

    scrollToElement: ->
        console.log 'st'
        startPos  = window.pageYOffset
        endPos    =
            @destination.getBoundingClientRect().top -
                document.body.getBoundingClientRect().top

        startTime = Date.now()
        duration  = @options.duration or DEFAULT_DURATION

        step = ->
            elapsed = Date.now() - startTime
            window.scroll(0, POSITION(startPos, endPos, elapsed, duration) )
            window.requestAnimationFrame(step) if elapsed < duration
        step()
