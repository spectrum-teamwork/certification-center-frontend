<template>
  <Layout>
    <template v-if="$page.services">
      <csd-service-post
        :price="$page.services.price"
        :heading="$page.services.post.heading"
        :content="$page.services.post.content"
        :cert-image="$page.services.post.requirements.image"
        :requirements="$page.services.post.requirements.content"
        :requirements-heading="$page.services.post.requirements.heading"
      />
    </template>
  </Layout>
</template>
<page-query>
query ($serviceId: ID) {
  services (id: $serviceId) {
    id
    price
    post {
      heading
      content
      requirements {
        image
        heading
        content
      }
    }
  }
}
</page-query>
<script>
import CsdPageFooter from '~/components/CsdPageFooter'
import CsdHeader from '~/components/CsdHeader'
import CsdBackwardButton from '~/components/CsdBackwardButton'
import CsdServicePost from '../../components/CsdServicePost'

export default {
  name: 'Service',
  components: { CsdServicePost, CsdBackwardButton, CsdHeader, CsdPageFooter }
}
</script>

<style lang="scss">

</style>