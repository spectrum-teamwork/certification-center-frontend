<template>
  <div class="container">
    <div class="row">
      <div class="col-12 col-lg-8 col-xxl-6">
        <div class="hero">
          <h1 class="hero__title">
            Испытания<br/>и сертификация<br/>продукции
          </h1>
          <p class="hero__description">
            Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the
            industry's
            standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to
            make a type specimen book.
          </p>
          <div class="hero__actions">
            <div @click="handleModalOpen" class="button button__order">Заказать</div>
            <span @click="handleModalOpen" class="hero__link">Проконсультироваться</span>
          </div>
        </div>
      </div>
    </div>
    <csd-modal v-model="modalVisible">
      <div class="col-12 col-md-10 col-lg-7 col-xl-9 col-xxl-8 col-xxxl-6 mx-auto">
        <csd-leave-order-form @close="handleModalClose" closeable class="mx-auto"/>
      </div>
    </csd-modal>
  </div>
</template>
<script>
import CsdModal from './CsdModal'
import CsdLeaveOrderForm from './CsdLeaveOrderForm'

export default {
  name: 'CsdHero',
  components: { CsdLeaveOrderForm, CsdModal },
  data() {
    return {
      modalVisible: false
    }
  },
  methods: {
    handleModalClose() {
      this.modalVisible = false
    },
    handleModalOpen() {
      this.modalVisible = true
    }
  }
}
</script>
