module FeedsHelper
  def create_publish_date(date)
    DateTime.parse(date).strftime('%d/%m/%Y %H:%M')
  end

  def get_facebook_script_tag
    '<div id="fb-root"></div>
     <script>(function(d, s, id) {
       var js, fjs = d.getElementsByTagName(s)[0];
       if (d.getElementById(id)) return;
       js = d.createElement(s); js.id = id;
       js.src = "//connect.facebook.net/en_GB/all.js#xfbml=1";
       fjs.parentNode.insertBefore(js, fjs);
    }(document, \'script\', \'facebook-jssdk\'));</script>'.html_safe
  end

  def get_facebook_like_tag(url)
    "<div class=\"fb-like fb-like-ex\" data-href=\"#{url}\" data-width=\"The pixel width of the plugin\" data-height=\"The pixel height of the plugin\" data-colorscheme=\"light\" data-layout=\"button_count\" data-action=\"like\" data-show-faces=\"false\" data-send=\"false\"></div>".html_safe
  end

  def get_hatena_bookmark_tag(title, url)
    "<a href=\"http://b.hatena.ne.jp/entry/#{url}\" class=\"hatena-bookmark-button\" data-hatena-bookmark-title=\"#{title}\" data-hatena-bookmark-layout=\"simple-balloon\" title=\"このエントリーをはてなブックマークに追加\"><img src=\"http://b.st-hatena.com/images/entry-button/button-only@2x.png\" alt=\"このエントリーをはてなブックマークに追加\" width=\"20\" height=\"25\" style=\"border: none;\" /></a><script type=\"text/javascript\" src=\"http://b.st-hatena.com/js/bookmark_button.js\" charset=\"utf-8\" async=\"async\"></script>".html_safe
  end

  def check_entries(feed)
    if feed.entries.blank?
      content_tag(:div, I18n.t('message.error.no_entries'), class: 'alert alert-error')
    end
  end
end
