export default {
  methods: {
    normalizeImageSrc(url) {
      const _url = new URL(url)
      return _url.pathname
    }
  }
}
