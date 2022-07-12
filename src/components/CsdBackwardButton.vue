<template>
  <a href="#" @click.prevent="$router.back()">
    <img src="/assets/img/backward.svg" alt="Указатель на предыдущуюю страницу"/>
  </a>
</template>

<script>
export default {
  name: 'CsdBackwardButton'
}
</script>
