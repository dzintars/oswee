import { ActionsUnion, createAction } from '@oswee/libs/action'
import { IOrder } from './contracts'

export enum OrderActionTypes {
  AddOrder = 'Order/AddOrder',
}

export const OrderActions = {
  addOrder: (order: IOrder) => createAction(OrderActionTypes.AddOrder, { order }),
}

// we leverage TypeScript token merging, so our consumer can use `Actions` for both runtime and compile time types 💪
export type OrderActionsUnion = ActionsUnion<typeof OrderActions>
