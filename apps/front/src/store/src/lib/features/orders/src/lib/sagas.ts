import { call, put, takeLatest } from 'redux-saga/effects'
import { Types } from './constants'
import { fetchOrderListRequest, fetchOrderListSuccess, fetchOrderListFailure } from './actions'
import { API } from './api'

function* fetchOrderListSaga(action) {
  yield put(fetchOrderListRequest())
  try {
    const orders = yield call(API.fetchOrders)
    yield put(fetchOrderListSuccess(orders))
  } catch (err) {
    console.error(err)
    yield put(fetchOrderListFailure(err))
  }
}

function* fetchOrderListListener() {
  yield takeLatest(Types.LIST_FETCH, fetchOrderListSaga)
}

export default [fetchOrderListListener]
