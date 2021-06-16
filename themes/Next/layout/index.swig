{% extends '_layout.swig' %}
{% import '_macro/post.swig' as post_template %}
{% import '_macro/sidebar.swig' as sidebar_template %}

{% block title %}{{ config.title }}{% if theme.index_with_subtitle and config.subtitle %} - {{config.subtitle }}{% endif %}{% endblock %}

{% block page_class %}
  {% if is_home() %} page-home {% endif %}
{% endblock %}

{% block content %}
  <section id="posts" class="posts-expand">
    {% for post in page.posts %}
      {{ post_template.render(post, true) }}
    {% endfor %}
  </section>

  {% include '_partials/pagination.swig' %}
{% endblock %}

{% block sidebar %}
  {{ sidebar_template.render(false) }}

<script>
  setTimeout(() => {
    if (NexT.utils)
    console.log("%c🚀 isDesktop: " + (NexT.utils.isDesktop()), "color:#888;")
  }, 2000)
</script>

<script>
setTimeout(() => {
  !function(e,t,n,g,i){e[i]=e[i]||function(){(e[i].q=e[i].q||[]).push(arguments)},n=t.createElement("script"),tag=t.getElementsByTagName("script")[0],n.async=1,n.src=('https:'==document.location.protocol?'https://':'http://')+g,tag.parentNode.insertBefore(n,tag)}(window,document,"script","assets.giocdn.com/2.1/gio.js","gio");
    gio('init','8cb04aec6e1d498e', {});

  //custom page code begin here
  console.log("%c🚀 GrowingIO: yes", "color:#888;")
  //custom page code end here

  gio('send');
}, 2000)

</script>

{% endblock %}

