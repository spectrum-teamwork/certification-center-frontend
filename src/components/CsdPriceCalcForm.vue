<template>
  <form class="price-calc-form" @submit.prevent="onFormSubmit">
    <div class="price-calc-form__heading">
      Рассичтать стоимость
    </div>
    <select required v-if="$context.serviceId === undefined">
      <option disabled hidden selected>Выберите услугу из списка</option>
      <option
        :value="node.id"
        v-model="form.serviceId"
        v-for="{node} in $static.allServices.edges">
        {{ node.title }}
      </option>
    </select>
    <input v-else ref="serviceIdInput" type="text" hidden :value="$context.serviceId">
    <input
      required
      type="text"
      name="fullname"
      placeholder="Имя"
      v-model="form.fullname"
      class="price-calc-form__input-name"
    >
    <input
      type="tel"
      name="tel"
      v-model="form.phone"
      placeholder="Номер телефона"
      class="price-calc-form__input-tel"
    >
    <button :class="['price-calc-form__button', submitButtonClasses]">{{ submitButtonText }}</button>
  </form>
</template>
<static-query>
query {
  allServices {
    edges {
      node {
        id
        title
      }
    }
  }
}
</static-query>
<script>
import createOrder from '../mixins/createOrder'

export default {
  name: 'CsdPriceCalcForm',
  mixins: [createOrder],
  data() {
    return {
      submitButtonTimeout: null,
      submitButtonText: 'Отправить',
      submitButtonClasses: {
        'price-calc-form__button_error': false,
        'price-calc-form__button_success': false
      },
      form: {
        service_id: undefined,
        contact_name: 'asdfasdf',
        phone: 'sdfasdf'
      }
    }
  },
  methods: {
    async onFormSubmit() {
      this.resetSubmitButton()
      await this.createOrder(this.form)
    },
    resetSubmitButton(timeout = 0) {
      clearTimeout(this.submitButtonTimeout)
      this.submitButtonTimeout = setTimeout(() => {
        this.submitButtonText = 'Отправить'
        this.submitButtonClasses['price-calc-form__button_error'] = false
        this.submitButtonClasses['price-calc-form__button_success'] = false
      }, timeout)
    }
  },
  watch: {
    'createOrderState.success': {
      handler(status) {
        if (status) {
          this.submitButtonText = 'Отправлено'
          this.submitButtonClasses['price-calc-form__button_success'] = true
          this.resetSubmitButton(1500)
        }
      }
    },
    'createOrderState.error': {
      handler(status) {
        if (status) {
          this.submitButtonText = 'Ошибка'
          this.submitButtonClasses['price-calc-form__button_error'] = true
          this.resetSubmitButton(1500)
        }
      }
    }
  },
  mounted() {
    if (this.$refs?.serviceIdInput) {
      this.form.service_id = this.$refs.serviceIdInput.value
    }
  }
}
</script>
