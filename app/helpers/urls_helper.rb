module UrlsHelper
  def create_digest(url)
    Digest::SHA256.hexdigest(url).slice(0..5)
  end

  def format_url(url)
    if url.match(/https?:\/\//)
      url
    else
      url = "http://" + url
    end
  end
end