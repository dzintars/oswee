import { AccountsState } from '../lib/features/accounts/src'
import { AppNavigationState } from '../lib/features/app-navigation/src'
import { ApplicationsState } from '../lib/features/applications/src'
import { LauncherState } from '../lib/features/launcher/src'
import { ModulesState } from '../lib/features/modules/src'
import { OrdersState } from '../lib/features/orders/src'
import { OrganizationsState } from '../lib/features/organizations/src'
import { PersonsState } from '../lib/features/persons/src'
import { RoutingState } from '../lib/features/routing/src'
import { SigninState } from '../lib/features/signin/src'
import { SystemState } from '../lib/features/system/src'
import { ThemeState } from '../lib/features/theme/src'
import { UiState } from '../lib/features/ui/src'
import { UsersState } from '../lib/features/users/src'
import { WebsocketState } from '../lib/features/websocket/src'

declare module 'MyTypes' {
  export interface RootState {
    readonly accounts: AccountsState
    readonly applications: AppNavigationState
    readonly apps: ApplicationsState
    readonly launcher: LauncherState
    readonly modules: ModulesState
    readonly orders: OrdersState
    readonly organizations: OrganizationsState
    readonly persons: PersonsState
    readonly routing: RoutingState
    readonly signin: SigninState
    readonly system: SystemState
    readonly theme: ThemeState
    readonly ui: UiState
    readonly users: UsersState
    readonly websocket: WebsocketState
  }
}

// export interface RootState {
//   readonly accounts: AccountsState
//   readonly applications: AppNavigationState
//   readonly apps: ApplicationsState
//   readonly launcher: LauncherState
//   readonly modules: ModulesState
//   readonly orders: OrdersState
//   readonly organizations: OrganizationsState
//   readonly persons: PersonsState
//   readonly routing: RoutingState
//   readonly signin: SigninState
//   readonly system: SystemState
//   readonly theme: ThemeState
//   readonly ui: UiState
//   readonly users: UsersState
//   readonly websocket: WebsocketState
// }
