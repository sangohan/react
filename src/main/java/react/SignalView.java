//
// React - a library for functional-reactive-like programming in Java
// Copyright (c) 2011, Three Rings Design, Inc. - All rights reserved.
// http://github.com/threerings/react/blob/master/LICENSE

package react;

/**
 * A view of a {@link Signal}, on which slots may listen, but to which one cannot emit events. This
 * is generally used to provide signal-like views of changing entities. See {@link AbstractValue}
 * for an example.
 */
public interface SignalView<T>
{
    /**
     * Connects this signal to the supplied slot, such that when an event is emitted from this
     * signal, the slot will be notified.
     * @return a connection instance which can be used to cancel the connection.
     */
    Connection connect (Slot<? super T> slot);

    /**
     * Disconnects the supplied slot from this signal if connect was called with it. If the slot has
     * been connected multiple times, all connections are cancelled.
     */
    void disconnect (Slot<? super T> slot);
}
