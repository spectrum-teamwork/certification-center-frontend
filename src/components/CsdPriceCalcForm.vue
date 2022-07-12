<template>
  <form class="price-calc-form">
    <div class="price-calc-form__heading">
      Рассичтать стоимость
    </div>
    <select v-if="$context.serviceId === undefined">
      <option
        :value="node.id"
        v-model="form.serviceId"
        v-for="{node} in $static.allServices.edges">
        {{ node.name }}
      </option>
    </select>
    <input
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
    <button class="price-calc-form__button">Отправить</button>
  </form>
</template>
<static-query>
query {
  allServices {
    edges {
      node {
        id
        name
      }
    }
  }
}
</static-query>
<script>
export default {
  name: 'CsdPriceCalcForm',
  data() {
    return {
      form: {
        serviceId: null,
        fullname: null,
        phone: null
      }
    }
  }
}
</script>

<style lang="scss">

</style>