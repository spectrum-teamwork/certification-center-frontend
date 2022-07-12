<template>
  <div class="wrapper">
    <csd-header>
      <template v-if="$route.path === '/'" #hero>
        <csd-hero/>
      </template>
    </csd-header>
    <main>
      <slot/>
    </main>
    <csd-page-footer/>
  </div>
</template>
<script>
import CsdHeader from '~/components/CsdHeader'
import CsdHero from '~/components/CsdHero'
import CsdPageFooter from '../components/CsdPageFooter'

export default {
  name: 'Default',
  components: { CsdPageFooter, CsdHeader, CsdHero }
}
</script>
<static-query>
query {
  metadata {
    siteName
  }
}
</static-query>
<style>
@font-face {
  font-family: 'Gilroy';
  src: url('../assets/fonts/Gilroy-Semibold.eot');
  src: local('Gilroy Semibold'), local('Gilroy-Semibold'),
  url('../assets/fonts/Gilroy-Semibold.eot?#iefix') format('embedded-opentype'),
  url('../assets/fonts/Gilroy-Semibold.woff2') format('woff2'),
  url('../assets/fonts/Gilroy-Semibold.woff') format('woff'),
  url('../assets/fonts/Gilroy-Semibold.ttf') format('truetype');
  font-weight: 600;
  font-style: normal;
  font-display: swap;
}
</style>