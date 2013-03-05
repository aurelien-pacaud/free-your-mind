package fr.isima

class DateTagLib {
  def stackDate = { attrs, body ->

    Date date = attrs.date
    if (date == null)
      return out

    out << '<span class="commentDate" title="' << date.format("yyyy-MM-dd HH:MM:ss") << '">'
    out <<     date.format("MMM dd") << " '" << date.format("yy") << " at " << date.format("HH:mm")
    out << '</span>'
    return out
  }

  def postDate = { attrs, body ->

    Date date = attrs.date
    if (date == null)
      return out

    out <<     date.format("MMM") << "<br/>" << date.format("dd") << "<br />" << date.format("yy")
    return out
  }
}
