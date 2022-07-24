<template>
  <Layout>
    <csd-post-header heading="Контакты"/>
    <div class="container container_contacts-page">
      <div class="row">
        <div class="col-12 col-lg-6">
          <csd-city-card
            city="Москва"
            phone="8 (800) 600-17-44"
            address="ул. Проспект Мира, дом 39, строение 2, офис 304 БЦ Олимпик Плаза II"
            email="krd@csd.expert"
            map="https://yandex.ru/map-widget/v1/?um=constructor%3Abb4bb561ccd2d0153b4d3a13b5a03ee53517690cfeba519f414eb180cbac8544&amp;source=constructor"
          />
        </div>
        <div class="col-12 col-lg-6">
          <csd-city-card
            class="mt-5 mt-lg-0"
            city="Краснодар"
            phone="8 (800) 600-17-44"
            address="ул. Адмирала, Крузенштерна, дом 6"
            email="krd@csd.expert"
            map="https://yandex.ru/map-widget/v1/?um=constructor%3Ab897e41dc872e0b0c843bb0379cf1498392b8e4817477ef7c346598bcf021334&amp;source=constructor"
          />
        </div>
      </div>
    </div>
    <csd-leave-order-section/>
  </Layout>
</template>

<script>
import CsdPostHeader from '../components/CsdPostHeader'
import CsdLeaveOrderSection from '../components/CsdLeaveOrderSection'
import CsdCityCard from '../components/CsdCityCard'

export default {
  name: 'Contacts',
  components: { CsdCityCard, CsdPostHeader, CsdLeaveOrderSection }
}
</script>

<style lang="scss">

</style>